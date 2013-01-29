// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mymonopoly.entity;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import net.mymonopoly.entity.HistoryPlayer;
import net.mymonopoly.entity.HistoryPlayerDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect HistoryPlayerDataOnDemand_Roo_DataOnDemand {
    
    declare @type: HistoryPlayerDataOnDemand: @Component;
    
    private Random HistoryPlayerDataOnDemand.rnd = new SecureRandom();
    
    private List<HistoryPlayer> HistoryPlayerDataOnDemand.data;
    
    public HistoryPlayer HistoryPlayerDataOnDemand.getNewTransientHistoryPlayer(int index) {
        HistoryPlayer obj = new HistoryPlayer();
        setCapital(obj, index);
        setKicked(obj, index);
        setMoney(obj, index);
        setName(obj, index);
        setPlayerId(obj, index);
        return obj;
    }
    
    public void HistoryPlayerDataOnDemand.setCapital(HistoryPlayer obj, int index) {
        int capital = index;
        obj.setCapital(capital);
    }
    
    public void HistoryPlayerDataOnDemand.setKicked(HistoryPlayer obj, int index) {
        Boolean kicked = Boolean.TRUE;
        obj.setKicked(kicked);
    }
    
    public void HistoryPlayerDataOnDemand.setMoney(HistoryPlayer obj, int index) {
        int money = index;
        obj.setMoney(money);
    }
    
    public void HistoryPlayerDataOnDemand.setName(HistoryPlayer obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void HistoryPlayerDataOnDemand.setPlayerId(HistoryPlayer obj, int index) {
        Long playerId = new Integer(index).longValue();
        obj.setPlayerId(playerId);
    }
    
    public HistoryPlayer HistoryPlayerDataOnDemand.getSpecificHistoryPlayer(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        HistoryPlayer obj = data.get(index);
        Long id = obj.getId();
        return HistoryPlayer.findHistoryPlayer(id);
    }
    
    public HistoryPlayer HistoryPlayerDataOnDemand.getRandomHistoryPlayer() {
        init();
        HistoryPlayer obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return HistoryPlayer.findHistoryPlayer(id);
    }
    
    public boolean HistoryPlayerDataOnDemand.modifyHistoryPlayer(HistoryPlayer obj) {
        return false;
    }
    
    public void HistoryPlayerDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = HistoryPlayer.findHistoryPlayerEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'HistoryPlayer' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<HistoryPlayer>();
        for (int i = 0; i < 10; i++) {
            HistoryPlayer obj = getNewTransientHistoryPlayer(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}