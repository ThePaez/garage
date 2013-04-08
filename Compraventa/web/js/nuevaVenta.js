window.onload=Init;
var canvas, ctx;
var imgcount=0;
var imagenes = {};
var fondo;
var dragok = false;
var mousex,mousey; //vars para el offset del mouse en el mousedrag del canvas
var dragStartx,dragStarty;
var isTagging = false;
var vistaImagen = true;

// getElementById
function $id(id) {
	return document.getElementById(id);
}
//
// output information
function Output(msg) {
	var m = $id("messages");
	m.innerHTML = msg + m.innerHTML;
}
//
// initialize
function Init() {
        if (!window.File || !window.FileList || !window.FileReader)
            return;
	var fileselect = $id("fileselect"),
		filedrag = $id("filedrag"),
		submitbutton = $id("submitbutton"),
                fondosel = $id("fondo");
        if(!fileselect)
            return;
    	// file select
	fileselect.addEventListener("change", FileSelectHandler, false);
        fondosel.onchange = CargaFondo;
        canvas = document.createElement("canvas"); 
	// is XHR2 available?
	var xhr = new XMLHttpRequest();
	if (xhr.upload) {
		// file drop
		filedrag.addEventListener("dragover", FileDragHover, false);
		filedrag.addEventListener("dragleave", FileDragHover, false);
		filedrag.addEventListener("drop", FileSelectHandler, false);
		filedrag.style.display = "block";
		// remove submit button
		submitbutton.style.display = "none";
                canvas.addEventListener("dragover", FileDragHover, false);
		canvas.addEventListener("dragleave", FileDragHover, false);
		canvas.addEventListener("drop", FileSelectHandler, false);
                
	}
        canvas.id     = "imgs";
        canvas.height = filedrag.offsetHeight=600;
        canvas.width  = filedrag.offsetWidth;
        canvas.tabIndex = 1;
        canvas.onmousedown = myDown;
        canvas.onmouseup = myUp;
        canvas.onkeypress = deleteImg;
        filedrag.appendChild(canvas);
        $('#frame').height(700);
        $('#frame1').height(700);
        ctx = canvas.getContext('2d');
        $id('Nombre').onkeyup=function() {guardaDetalles(imgcount-1,"Nombre",null,null)};
        $id('Precio').onkeyup=function() {guardaDetalles(imgcount-1,null,"Precio",null)};
        $id('Comentarios').onkeyup=function() {guardaDetalles(imgcount-1,null,null,"Comentarios")};
}

function toggleTagging(){
    isTagging=!isTagging;
    if(isTagging)
        canvas.style.cursor="crosshair";
    else
        canvas.style.cursor="auto";
}

function CargaFondo(e){
    var f = e.target.files[0];
    var reader = new FileReader();
    reader.onload = function(event){
        var img = new Image();
        img.onload = function(){
            fondo = img;
            repaint();
        }
        img.src = event.target.result;
    }
    reader.readAsDataURL(f);
}

// file drag hover
function FileDragHover(e) {
	e.stopPropagation();
	e.preventDefault();
        if(e.target.id != "filedrag")
            e.target.parentElement.className = (e.type == "dragover" ? "hover" : "");
        else 
            e.target.className = (e.type == "dragover" ? "hover" : "");
}

function deleteImg(e){
    var charStr = String.fromCharCode(e.which);
    if(charStr == 'd' || charStr == 'D'){
        if(imgcount>0)
            imgcount--;
        repaint();
    } else if(charStr == 'u' || charStr == 'U'){
        if(count(imagenes)>imgcount)
            imgcount++;
        repaint();
    }
}

function count(obj){
    return Object.keys(obj).length;
}

// file selection
function FileSelectHandler(e) {
	// cancel event and hover styling
	FileDragHover(e);
	// fetch FileList object
	var files = e.target.files || e.dataTransfer.files;
	// process all File objects
	for (var i = 0, f; f = files[i]; i++) {
            if(isImage(f))
                handleImage(e,f);
            else
                alert(f.name + ' no es una imagen, o es un formato no soportado');
	}
}
function isImage(file) {
    var temp = file.name.split(".");
    if(temp[temp.length-1].toLowerCase() == "svg")
        return false;
    return file.type.indexOf('image') != -1;
}
function handleImage(e,f){
    var reader = new FileReader();
    var x,y;
    x = e.offsetX;
    y = e.offsetY;
    reader.onload = function(event){
        var img = new Image();
        img.onload = function(){
            if(x == undefined || y == undefined){
                x = Math.floor(Math.random()*(canvas.width-img.width));
                y = Math.floor(Math.random()*(canvas.height-img.height));
                if(x<0)x=0;
                if(y<0)y=0;
            }
            imagenes[imgcount++]={X:x,Y:y,imagen:img,file:f,precio:0.0,comentarios:'',nombre:f.name.split('.')[0]};
            repaint();
        }
        img.src = event.target.result;
    }
    reader.readAsDataURL(f);     
}
function repaint(e){
    if(vistaImagen){
        if(fondo == undefined){
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        } else {
            ctx.drawImage(fondo,0,0,canvas.width,canvas.height);
        }
        for(i=0;i<imgcount;i++){
            if(imagenes[i].file == undefined) //Imagen taggeada no hay que renderear
                continue;
            ctx.drawImage(imagenes[i].imagen,imagenes[i].X,imagenes[i].Y);
        }
        if(imgcount > 0){
            var ti = imagenes[imgcount-1];
            $id("Nombre").value=ti.nombre;
            $id("Precio").value=ti.precio;
            $id("Comentarios").value=ti.comentarios;
            ctx.strokeStyle = "#fb0";
            ctx.strokeRect(ti.X,ti.Y,ti.imagen.width,ti.imagen.height);
        }
        if(isTagging && e != undefined){
            ctx.strokeStyle = "#555";
            ctx.strokeRect(dragStartx,dragStarty,e.offsetX-dragStartx,e.offsetY-dragStarty);
        }
    } else {
        var td = $id("listaSet");
        while (td.hasChildNodes())
            td.removeChild(td.lastChild);
        var leg = document.createElement('legend');
        leg.innerHTML = 'Tus artículos';
        td.appendChild(leg);
        if(imgcount>0){
            var tabla = document.createElement("table");
            tabla.className = "TablaLista";
            var tr,td1,div,lblnom,lblprec,nomIn,precIn;
            for(i=0;i<imgcount;i++){
                if(i%3==0){
                    tr = document.createElement("tr");
                    tabla.appendChild(tr);
                }
                td1 = document.createElement("td");
                tr.appendChild(td1);
                div = document.createElement("div");
                div.className = "imgdiv";
                imagenes[i].imagen.style.maxWidth = "100%";
                imagenes[i].imagen.style.maxHeight = "100%";
                div.appendChild(imagenes[i].imagen);
                td1.appendChild(div);
                lblnom = document.createElement("label");
                lblnom.htmlFor = "nomIn"+i;
                lblnom.innerHTML = "Nombre:";
                lblprec = document.createElement("label");
                lblprec.htmlFor = "precIn"+i;
                lblprec.innerHTML = "Precio :";
                precIn = document.createElement("input");
                precIn.value = imagenes[i].precio;
                precIn.id = "precIn"+i;
                precIn.onkeyup = (function(index,id) {return function(){guardaDetalles(index,null,id,null)}})(i,precIn.id);
                nomIn = document.createElement("input");
                nomIn.value = imagenes[i].nombre;
                nomIn.id = "nomIn"+i;
                nomIn.onkeyup = (function(index,id) {return function(){guardaDetalles(index,id,null,null)}})(i,nomIn.id);
                td1.appendChild(lblnom);
                td1.appendChild(nomIn);
                td1.appendChild(document.createElement("br"));
                td1.appendChild(lblprec);
                td1.appendChild(precIn);
            }
            td.appendChild(tabla);
        } else {
            var lbl = document.createElement("label");
            lbl.value = "No hay artículos que mostrar";
            td.appendChild(lbl);
        }
    }
}
function guardaDetalles(numImg,idN,idP,idC){
    if(imgcount>0){
        if(idN != null)
            imagenes[numImg].nombre = $id(idN).value;
        if(idP != null)
            imagenes[numImg].precio = $id(idP).value;
        if(idC != null)
            imagenes[numImg].comentarios = $id(idC).value;
    }
}
function myMove(e){
    if (dragok && imagenes[imgcount-1].file != undefined){ //imágenes taggeadas no se mueven!
        imagenes[imgcount-1].X=e.offsetX+mousex;
        imagenes[imgcount-1].Y=e.offsetY+mousey;
        repaint();
    } else if(isTagging){
        repaint(e);
    }
}

function myDown(e){
    var x,y,selected;
    if(isTagging){
        dragStartx = e.offsetX;
        dragStarty = e.offsetY;
        repaint();
        dragok = false;
        canvas.onmousemove = myMove;
    } else {
        x = e.offsetX;
        y = e.offsetY;
        selected = moveToTop(x,y); //Mueve la imagen seleccionada hasta arriba de la pila
        repaint();
        dragok = selected!=null && imgcount>0;
        canvas.onmousemove = myMove;
    }
}

function myUp(e){
    dragok = false;
    canvas.onmousemove = null;
    if(isTagging && fondo != undefined){
        var img = new Image();
        var tmpCanvas = document.createElement('canvas');
        tmpCanvas.width = e.offsetX-dragStartx;
        tmpCanvas.height = e.offsetY-dragStarty;
        if(tmpCanvas.width < 2 && tmpCanvas.height < 2){
            repaint(e);
            return;
        }
        var tctx = tmpCanvas.getContext('2d');
        img.onload=function(){
            tctx.drawImage(img, dragStartx, dragStarty, tmpCanvas.width, tmpCanvas.height
            , 0, 0, tmpCanvas.width, tmpCanvas.height);
            img = new Image();
            img.onload=function(){
                imagenes[imgcount++]={X:dragStartx,Y:dragStarty,imagen:img,nombre:'nuevo artículo',precio:0.0,comentarios:''};
                repaint(e);
            }
            img.src = tmpCanvas.toDataURL();
        }
        img.src = canvas.toDataURL();
    } else {
        repaint();
    }
}

function moveToTop(x,y){
    var selected = getSelected(x,y);
    if(selected==null || imgcount == 0)
        return selected;
    var temp = imagenes[selected];
    for(i=selected;i<imgcount-1;i++)
        imagenes[i]=imagenes[i+1];
    imagenes[imgcount-1]=temp;
    mousex = temp.X-x;
    mousey = temp.Y-y;
    return selected;
}
function getSelected(x,y){
    var ix,iy,w,h,selected=null;
    for(i=imgcount-1;i>=0;i--){
        w = imagenes[i].imagen.width;
        h = imagenes[i].imagen.height;
        ix = imagenes[i].X;
        iy = imagenes[i].Y;
        if(ix<=x && x<=ix+w){
            if(iy<=y && y<=iy+h){
                selected=i;
                break;
            }
        }
    }
    return selected;
}
function listo(){
    
}

function verImagen(){
    vistaImagen = true;
    $id("VistaImagen").removeAttribute("hidden");
    $id("VistaLista").hidden = "hidden";
    $id("TagButton").onclick=toggleTagging;
    $id("fondo").onclick=CargaFondo;
    window.setTimeout(repaint,1);//Para evitar glitches en repaint...
}

function verLista(){
    vistaImagen = false;
    repaint();
    $id("VistaImagen").hidden = "hidden";
    $id("VistaLista").removeAttribute("hidden");
    $id("TagButton").onclick=null;
    $id("fondo").onclick=null;
}