/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cv.Entities;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Andres
 */
@Entity
@Table(name = "carrito_x_producto", catalog = "compraventa", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CarritoXProducto.findAll", query = "SELECT c FROM CarritoXProducto c"),
    @NamedQuery(name = "CarritoXProducto.findByIdCarrito", query = "SELECT c FROM CarritoXProducto c WHERE c.carritoXProductoPK.idCarrito = :idCarrito"),
    @NamedQuery(name = "CarritoXProducto.findByIdProducto", query = "SELECT c FROM CarritoXProducto c WHERE c.carritoXProductoPK.idProducto = :idProducto"),
    @NamedQuery(name = "CarritoXProducto.findByCantidad", query = "SELECT c FROM CarritoXProducto c WHERE c.cantidad = :cantidad")})
public class CarritoXProducto implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CarritoXProductoPK carritoXProductoPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CANTIDAD")
    private int cantidad;
    @JoinColumn(name = "ID_PRODUCTO", referencedColumnName = "ID_PRODUCTO", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Producto producto;
    @JoinColumn(name = "ID_CARRITO", referencedColumnName = "ID_CARRITO", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Carrito carrito;

    public CarritoXProducto() {
    }

    public CarritoXProducto(CarritoXProductoPK carritoXProductoPK) {
        this.carritoXProductoPK = carritoXProductoPK;
    }

    public CarritoXProducto(CarritoXProductoPK carritoXProductoPK, int cantidad) {
        this.carritoXProductoPK = carritoXProductoPK;
        this.cantidad = cantidad;
    }

    public CarritoXProducto(int idCarrito, int idProducto) {
        this.carritoXProductoPK = new CarritoXProductoPK(idCarrito, idProducto);
    }

    public CarritoXProductoPK getCarritoXProductoPK() {
        return carritoXProductoPK;
    }

    public void setCarritoXProductoPK(CarritoXProductoPK carritoXProductoPK) {
        this.carritoXProductoPK = carritoXProductoPK;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Carrito getCarrito() {
        return carrito;
    }

    public void setCarrito(Carrito carrito) {
        this.carrito = carrito;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (carritoXProductoPK != null ? carritoXProductoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CarritoXProducto)) {
            return false;
        }
        CarritoXProducto other = (CarritoXProducto) object;
        if ((this.carritoXProductoPK == null && other.carritoXProductoPK != null) || (this.carritoXProductoPK != null && !this.carritoXProductoPK.equals(other.carritoXProductoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.cv.Objects.CarritoXProducto[ carritoXProductoPK=" + carritoXProductoPK + " ]";
    }
    
}
