/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cv.SessionBeans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.cv.Entities.CarritoXProducto;

/**
 *
 * @author Andres
 */
@Stateless
public class CarritoXProductoFacade extends AbstractFacade<CarritoXProducto> {
    @PersistenceContext(unitName = "Compraventa-usuario")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CarritoXProductoFacade() {
        super(CarritoXProducto.class);
    }
    
}
