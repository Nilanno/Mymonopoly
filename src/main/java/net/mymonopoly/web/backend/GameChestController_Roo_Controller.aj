// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.mymonopoly.web.backend;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import net.mymonopoly.entity.GameChest;
import net.mymonopoly.entity.GameTheme;
import net.mymonopoly.web.backend.GameChestController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect GameChestController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GameChestController.create(@Valid GameChest gameChest, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, gameChest);
            return "/backend/gamechests/create";
        }
        uiModel.asMap().clear();
        gameChest.persist();
        return "redirect://backend/gamechests/" + encodeUrlPathSegment(gameChest.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GameChestController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GameChest());
        return "/backend/gamechests/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String GameChestController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("gamechest", GameChest.findGameChest(id));
        uiModel.addAttribute("itemId", id);
        return "/backend/gamechests/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GameChestController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("gamechests", GameChest.findGameChestEntries(firstResult, sizeNo));
            float nrOfPages = (float) GameChest.countGameChests() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("gamechests", GameChest.findAllGameChests());
        }
        return "/backend/gamechests/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GameChestController.update(@Valid GameChest gameChest, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, gameChest);
            return "/backend/gamechests/update";
        }
        uiModel.asMap().clear();
        gameChest.merge();
        return "redirect://backend/gamechests/" + encodeUrlPathSegment(gameChest.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String GameChestController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, GameChest.findGameChest(id));
        return "/backend/gamechests/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String GameChestController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GameChest gameChest = GameChest.findGameChest(id);
        gameChest.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect://backend/gamechests";
    }
    
    void GameChestController.populateEditForm(Model uiModel, GameChest gameChest) {
        uiModel.addAttribute("gameChest", gameChest);
        uiModel.addAttribute("gamethemes", GameTheme.findAllGameThemes());
    }
    
    String GameChestController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
