// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mymonopoly.entity;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import net.mymonopoly.entity.GameChance;
import net.mymonopoly.entity.GameTheme;

privileged aspect GameChance_Roo_Finder {
    
    public static TypedQuery<GameChance> GameChance.findGameChancesByTheme(GameTheme theme) {
        if (theme == null) throw new IllegalArgumentException("The theme argument is required");
        EntityManager em = GameChance.entityManager();
        TypedQuery<GameChance> q = em.createQuery("SELECT o FROM GameChance AS o WHERE o.theme = :theme", GameChance.class);
        q.setParameter("theme", theme);
        return q;
    }
    
}
