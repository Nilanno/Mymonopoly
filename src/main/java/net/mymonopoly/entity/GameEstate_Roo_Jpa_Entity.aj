// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mymonopoly.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import net.mymonopoly.entity.GameEstate;

privileged aspect GameEstate_Roo_Jpa_Entity {
    
    declare @type: GameEstate: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long GameEstate.id;
    
    @Version
    @Column(name = "version")
    private Integer GameEstate.version;
    
    public Long GameEstate.getId() {
        return this.id;
    }
    
    public void GameEstate.setId(Long id) {
        this.id = id;
    }
    
    public Integer GameEstate.getVersion() {
        return this.version;
    }
    
    public void GameEstate.setVersion(Integer version) {
        this.version = version;
    }
    
}