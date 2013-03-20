/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cv.Entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Andres
 */
@Entity
@Table(name = "carrito", catalog = "compraventa", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Carrito.findAll", query = "SELECT c FROM Carrito c"),
    @NamedQuery(name = "Carrito.findByIdCarrito", query = "SELECT c FROM Carrito c WHERE c.idCarrito = :idCarrito"),
    @NamedQuery(name = "Carrito.findByFechaUltimaActualizacion", query = "SELECT c FROM Carrito c WHERE c.fechaUltimaActualizacion = :fechaUltimaActualizacion")})
public class Carrito implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_CARRITO")
    private Integer idCarrito;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FECHA_ULTIMA_ACTUALIZACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaUltimaActualizacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "carrito")
    private Collection<CarritoXProducto> carritoXProductoCollection;
    @JoinColumn(name = "USUARIO", referencedColumnName = "USUARIO")
    @ManyToOne(optional = false)
    private Usuario usuario;

    public Carrito() {
    }

    public Carrito(Integer idCarrito) {
        this.idCarrito = idCarrito;
    }

    public Carrito(Integer idCarrito, Date fechaUltimaActualizacion) {
        this.idCarrito = idCarrito;
        this.fechaUltimaActualizacion = fechaUltimaActualizacion;
    }

    public Integer getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(Integer idCarrito) {
        this.idCarrito = idCarrito;
    }

    public Date getFechaUltimaActualizacion() {
        return fechaUltimaActualizacion;
    }

    public void setFechaUltimaActualizacion(Date fechaUltimaActualizacion) {
        this.fechaUltimaActualizacion = fechaUltimaActualizacion;
    }

    @XmlTransient
    public Collection<CarritoXProducto> getCarritoXProductoCollection() {
        return carritoXProductoCollection;
    }

    public void setCarritoXProductoCollection(Collection<CarritoXProducto> carritoXProductoCollection) {
        this.carritoXProductoCollection = carritoXProductoCollection;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCarrito != null ? idCarrito.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Carrito)) {
            return false;
        }
        Carrito other = (Carrito) object;
        if ((this.idCarrito == null && other.idCarrito != null) || (this.idCarrito != null && !this.idCarrito.equals(other.idCarrito))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.cv.Objects.Carrito[ idCarrito=" + idCarrito + " ]";
    }
    
}
