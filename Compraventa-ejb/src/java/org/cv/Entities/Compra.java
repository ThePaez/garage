/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cv.Entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Andres
 */
@Entity
@Table(name = "compra", catalog = "compraventa", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Compra.findAll", query = "SELECT c FROM Compra c"),
    @NamedQuery(name = "Compra.findByIdCompra", query = "SELECT c FROM Compra c WHERE c.idCompra = :idCompra"),
    @NamedQuery(name = "Compra.findByFechaCompra", query = "SELECT c FROM Compra c WHERE c.fechaCompra = :fechaCompra"),
    @NamedQuery(name = "Compra.findByPrecioTotal", query = "SELECT c FROM Compra c WHERE c.precioTotal = :precioTotal"),
    @NamedQuery(name = "Compra.findByLiquidado", query = "SELECT c FROM Compra c WHERE c.liquidado = :liquidado")})
public class Compra implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_COMPRA")
    private Integer idCompra;
    @Size(max = 45)
    @Column(name = "FECHA_COMPRA")
    private String fechaCompra;
    @Size(max = 45)
    @Column(name = "PRECIO_TOTAL")
    private String precioTotal;
    @Basic(optional = false)
    @NotNull
    @Column(name = "LIQUIDADO")
    private boolean liquidado;
    @JoinColumn(name = "USUARIO", referencedColumnName = "USUARIO")
    @ManyToOne(optional = false)
    private Usuario usuario;
    @JoinColumn(name = "ID_FORMA_PAGO", referencedColumnName = "ID_FORMA_PAGO")
    @ManyToOne(optional = false)
    private FormaPago idFormaPago;
    @JoinColumn(name = "ID_DIRECCION", referencedColumnName = "ID_DIRECCION")
    @ManyToOne(optional = false)
    private Direccion idDireccion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "compra")
    private Collection<CompraXProducto> compraXProductoCollection;

    public Compra() {
    }

    public Compra(Integer idCompra) {
        this.idCompra = idCompra;
    }

    public Compra(Integer idCompra, boolean liquidado) {
        this.idCompra = idCompra;
        this.liquidado = liquidado;
    }

    public Integer getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(Integer idCompra) {
        this.idCompra = idCompra;
    }

    public String getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public String getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(String precioTotal) {
        this.precioTotal = precioTotal;
    }

    public boolean getLiquidado() {
        return liquidado;
    }

    public void setLiquidado(boolean liquidado) {
        this.liquidado = liquidado;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public FormaPago getIdFormaPago() {
        return idFormaPago;
    }

    public void setIdFormaPago(FormaPago idFormaPago) {
        this.idFormaPago = idFormaPago;
    }

    public Direccion getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(Direccion idDireccion) {
        this.idDireccion = idDireccion;
    }

    @XmlTransient
    public Collection<CompraXProducto> getCompraXProductoCollection() {
        return compraXProductoCollection;
    }

    public void setCompraXProductoCollection(Collection<CompraXProducto> compraXProductoCollection) {
        this.compraXProductoCollection = compraXProductoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCompra != null ? idCompra.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Compra)) {
            return false;
        }
        Compra other = (Compra) object;
        if ((this.idCompra == null && other.idCompra != null) || (this.idCompra != null && !this.idCompra.equals(other.idCompra))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.cv.Objects.Compra[ idCompra=" + idCompra + " ]";
    }
    
}
