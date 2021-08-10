package com.assignment.lookify.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.lookify.models.Song;
import com.assignment.lookify.services.SongService;

@Controller
public class LookifyController {

	private final SongService songService;
	
	public LookifyController(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "home.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("songs", songService.allSongs());
		return "dashboard.jsp";
	}
	
	@RequestMapping("/songs/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		model.addAttribute("song", songService.findSong(id));
		return "/view.jsp";
	}
	
	
	@RequestMapping("/songs/new")
	public String add(Model model) {
		model.addAttribute("song", new Song());
		return "new.jsp";
	}
	
	@RequestMapping(value="/songs/new", method=RequestMethod.POST)
	public String newSong(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if(result.hasErrors()) {
			return "new.jsp";
		}
		else {
			songService.saveSong(song);
			return "redirect:/dashboard";
		}
	}
	
//	search by artist:
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String search(@RequestParam(value="artist", required=false) String artist, Model model) {
		model.addAttribute("artistSongs", songService.listSongsByArtist(artist));
		model.addAttribute("artist", artist);
		return "artistsongs.jsp";
	}
	
//	Top 10 songs:
	@RequestMapping("/topten")
	public String topten(Model model){
		model.addAttribute("songs", songService.topTenSongs());
		return "topten.jsp";
	}
	
//  delete method
	@RequestMapping(value="/songs/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}
}
