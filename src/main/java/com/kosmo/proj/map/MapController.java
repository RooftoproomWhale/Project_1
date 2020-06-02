package com.kosmo.proj.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
   
   @RequestMapping("/Homespital/Map.hst")
   public String map()
   {
      return "Map.tiles";
   }
}