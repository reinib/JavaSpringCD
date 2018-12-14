package com.codingdojo.Languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.Languages.models.Language;
import com.codingdojo.Languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	//	adding the language repository as a dependency
	private final LanguageRepository languageRepository;
	
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
	
	//	returns all the languages
	public List<Language> allLanguages(){
		return languageRepository.findAll();
	}
	
	//	creates a language
	public Language createLanguage(Language l) {
		return languageRepository.save(l);
	}
	
    // updates language
    public Language updateLanguage(Language language) {
    	return languageRepository.save(language);
    }
    
    // delete language
    public void deleteById(Long id) {
    	languageRepository.deleteById(id);
    }
	
	//	retrieves a language
	public Language findLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		if(optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;
		}
	}
}
