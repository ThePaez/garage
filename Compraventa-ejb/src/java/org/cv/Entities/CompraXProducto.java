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
@Table(name = "compra_x_producto", catalog = "compraventa", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CompraXProducto.findAll", query = "SELECT c FROM CompraXProducto c"),
    @NamedQuery(name = "CompraXProducto.findByIdCompra", query = "SELECT c FROM CompraXProducto c WHERE c.compraXProductoPK.idCompra = :idCompra"),
    @NamedQuery(name = "CompraXProducto.findByIdProducto", query = "SELECT c FROM CompraXProducto c WHERE c.compraXProductoPK.idProducto = :idProducto"),
    @NamedQuery(name = "CompraXProducto.findByCantidad", query = "SELECT c FROM CompraXProducto c WHERE c.cantidad = :cantidad")})
public class CompraXProducto implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CompraXProductoPK compraXProductoPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CANTIDAD")
    private int cantidad;
    @JoinColumn(name = "ID_PRODUCTO", referencedColumnName = "ID_PRODUCTO", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Producto producto;
    @JoinColumn(name = "ID_COMPRA", referencedColumnName = "ID_COMPRA", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Compra compra;

    public CompraXProducto() {
    }

    public CompraXProducto(CompraXProductoPK compraXProductoPK) {
        this.compraXProductoPK = compraXProductoPK;
    }

    public CompraXProducto(CompraXProductoPK compraXProductoPK, int cantidad) {
        this.compraXProductoPK = compraXProductoPK;
        this.cantidad = cantidad;
    }

    public CompraXProducto(int idCompra, int idProducto) {
        this.compraXProductoPK = new CompraXProductoPK(idCompra, idProducto);
    }

    public CompraXProductoPK getCompraXProductoPK() {
        return compraXProductoPK;
    }

    public void setCompraXProductoPK(CompraXProductoPK compraXProductoPK) {
        this.compraXProductoPK = compraXProductoPK;
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

    public Compra getCompra() {
        return compra;
    }

    public void setCompra(Compra compra) {
        this.compra = compra;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (compraXProductoPK != null ? compraXProductoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CompraXProducto)) {
            return false;
        }
        CompraXProducto other = (CompraXProducto) object;
        if ((this.compraXProductoPK == null && other.compraXProductoPK != null) || (this.compraXProductoPK != null && !this.compraXProductoPK.equals(other.compraXProductoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.cv.Objects.CompraXProducto[ compraXProductoPK=" + compraXProductoPK + " ]";
    }
    
}
