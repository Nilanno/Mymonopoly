// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mymonopoly.entity;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.mymonopoly.entity.GameChance;
import org.springframework.transaction.annotation.Transactional;

privileged aspect GameChance_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager GameChance.entityManager;
    
    public static final EntityManager GameChance.entityManager() {
        EntityManager em = new GameChance().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long GameChance.countGameChances() {
        return entityManager().createQuery("SELECT COUNT(o) FROM GameChance o", Long.class).getSingleResult();
    }
    
    public static List<GameChance> GameChance.findAllGameChances() {
        return entityManager().createQuery("SELECT o FROM GameChance o", GameChance.class).getResultList();
    }
    
    public static GameChance GameChance.findGameChance(Long id) {
        if (id == null) return null;
        return entityManager().find(GameChance.class, id);
    }
    
    public static List<GameChance> GameChance.findGameChanceEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM GameChance o", GameChance.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void GameChance.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void GameChance.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            GameChance attached = GameChance.findGameChance(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void GameChance.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void GameChance.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public GameChance GameChance.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        GameChance merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
