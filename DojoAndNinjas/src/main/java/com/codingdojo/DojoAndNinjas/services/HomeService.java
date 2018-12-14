package com.codingdojo.DojoAndNinjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.DojoAndNinjas.models.Dojo;
import com.codingdojo.DojoAndNinjas.models.Ninja;
import com.codingdojo.DojoAndNinjas.repositories.DojoRepository;
import com.codingdojo.DojoAndNinjas.repositories.NinjaRepository;

@Service
public class HomeService {
	private final DojoRepository dojoRepo;
	private final NinjaRepository ninjaRepo;
	
	public HomeService(DojoRepository dojoRepo, NinjaRepository ninjaRepo) {
		this.dojoRepo = dojoRepo;
		this.ninjaRepo = ninjaRepo;
	}
	public Dojo createDojo(Dojo d) {
		return dojoRepo.save(d);
	}
	public Ninja createNinja(Ninja n) {
		return ninjaRepo.save(n);
	}
	public List<Ninja> allNinjas(){
		return ninjaRepo.findAll();
	}
	public List<Dojo> allDojos(){
		return dojoRepo.findAll();
	}
    public Dojo findDojo(Long id) {
        Optional<Dojo> optionalDojo = dojoRepo.findById(id);
        if(optionalDojo.isPresent()) {
            return optionalDojo.get();
        } else {
            return null;
        }
    }
}
