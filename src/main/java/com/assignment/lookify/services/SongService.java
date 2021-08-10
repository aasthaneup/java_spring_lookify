package com.assignment.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.assignment.lookify.models.Song;
import com.assignment.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository songRepo;
	public SongService(SongRepository songRepo) {
		this.songRepo = songRepo;
	}
	public List<Song> allSongs(){
		return songRepo.findAll();
	}
	public Song saveSong(Song song) {
		return songRepo.save(song);
	}
	public Song findSong(Long id) {
		Optional<Song> optSong = songRepo.findById(id);
		if(optSong.isPresent()) {
			return optSong.get();
		} else {
			return null;
		}
	}
	public List<Song> listSongsByArtist(String artistKeyword){
		return songRepo.findByArtistContaining(artistKeyword);
	}
	public List<Song> topTenSongs(){
		return songRepo.findTop10ByOrderByRatingDesc();
	}
	public void deleteSong(Long id) {
		songRepo.deleteById(id);
	}
}