package com.assignment.lookify.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.assignment.lookify.models.Song;

@Repository
public interface SongRepository extends CrudRepository<Song, Long>{

	List<Song> findAll();
	
	Optional<Song> findById(Long id);
	
	void deleteById(Long id);
	
	List<Song> findByArtistContaining(String artistKeyword);

	List<Song> findTop10ByOrderByRatingDesc();
}
