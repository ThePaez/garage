/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cv.SessionBeans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.cv.Entities.Carrito;

/**
 *
 * @author Andres
 */
@Stateless
public class CarritoFacade extends AbstractFacade<Carrito> {
    @PersistenceContext(unitName = "Compraventa-usuario")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CarritoFacade() {
        super(Carrito.class);
    }
    
}
