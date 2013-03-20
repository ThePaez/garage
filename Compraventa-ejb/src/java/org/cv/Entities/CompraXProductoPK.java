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
public class CompraXProductoPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_COMPRA")
    private int idCompra;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_PRODUCTO")
    private int idProducto;

    public CompraXProductoPK() {
    }

    public CompraXProductoPK(int idCompra, int idProducto) {
        this.idCompra = idCompra;
        this.idProducto = idProducto;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
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
        hash += (int) idCompra;
        hash += (int) idProducto;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CompraXProductoPK)) {
            return false;
        }
        CompraXProductoPK other = (CompraXProductoPK) object;
        if (this.idCompra != other.idCompra) {
            return false;
        }
        if (this.idProducto != other.idProducto) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.cv.Objects.CompraXProductoPK[ idCompra=" + idCompra + ", idProducto=" + idProducto + " ]";
    }
    
}
