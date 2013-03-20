/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cv.SessionBeans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.cv.Entities.Direccion;

/**
 *
 * @author Andres
 */
@Stateless
public class DireccionFacade extends AbstractFacade<Direccion> {
    @PersistenceContext(unitName = "Compraventa-usuario")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DireccionFacade() {
        super(Direccion.class);
    }
    
}
