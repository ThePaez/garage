/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cv.Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Andres
 */
@Embeddable
public class CarritoXProductoPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_CARRITO")
    private int idCarrito;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_PRODUCTO")
    private int idProducto;

    public CarritoXProductoPK() {
    }

    public CarritoXProductoPK(int idCarrito, int idProducto) {
        this.idCarrito = idCarrito;
        this.idProducto = idProducto;
    }

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idCarrito;
        hash += (int) idProducto;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CarritoXProductoPK)) {
            return false;
        }
        CarritoXProductoPK other = (CarritoXProductoPK) object;
        if (this.idCarrito != other.idCarrito) {
            return false;
        }
        if (this.idProducto != other.idProducto) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.cv.Objects.CarritoXProductoPK[ idCarrito=" + idCarrito + ", idProducto=" + idProducto + " ]";
    }
    
}
