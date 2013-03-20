/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cv.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.cv.Entities.Usuario;
import org.cv.SessionBeans.UsuarioFacade;

/**
 *
 * @author Andres
 */
public class ControladorUsuario extends HttpServlet {
    @EJB
    private UsuarioFacade uf;
    
    public static String uncat(String t){
        if(t == null)
            return null;
        String ret = "";
        for (int i = 0; i < t.length()/3; i++)
            ret+=t.charAt(i*3+2);
        return ret;
    }
    
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String lout = (String)request.getParameter("logout");
            if(lout != null){
                this.getServletContext().removeAttribute("Usuario");
                out.append("Sesión cerrada");
                response.addCookie(new Cookie("Usuario","null"));
                return;
            }
            String unom = (String)request.getParameter("usuario");
            String pass = uncat((String)request.getParameter("password"));
            String correo = (String)request.getParameter("email");
            Usuario buscado = uf.find(unom);
            if(pass == null){ //Sólo checar si ya existe usuario
                if(buscado == null)
                    out.append("Usuario no existe");
                else
                    out.append("Usuario existe");
                return;
            }
            if(correo == null){ //Inicio de sesión requerido
                if(buscado !=null){
                    this.getServletContext().setAttribute("Usuario", unom);
                    response.addCookie(new Cookie("Usuario",unom));
                    out.append("Sesión iniciada");
                } else {
                    out.append("Usuario no encontrado");
                }
            } else { //Creación de usuario nuevo
                if(buscado !=null){
                    out.append("Usuario ya existe");
                } else {
                    Usuario nuevo = new Usuario(unom); //Usa constructor con valores default para que no truene por nullpointer
                    nuevo.setPassword(pass);
                    nuevo.setCorreo(correo);
                    uf.create(nuevo);
                    response.addCookie(new Cookie("Usuario",unom));
                    this.getServletContext().setAttribute("Usuario", unom); //Inicia sesión al mismo tiempo
                    out.append("Usuario creado");
                }
            }
            
            
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
