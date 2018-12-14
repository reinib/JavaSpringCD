package com.codingdojo.theCode;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CodeController {
	@RequestMapping("/")
	public String home() {
		return "index.jsp";
	}
	@RequestMapping(value="/validate", method=RequestMethod.POST)
	public String validateWord(@RequestParam(value="codeWord")String codeWord) {
		if (codeWord.equals("bushido")) {
			return "redirect:/code";
		}
		else {
			return "redirect:/createError";
		}
	}
	@RequestMapping("/createError")
	public String flashMessages(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("error", "You must train harder!");
		return "redirect:/";
	}
	@RequestMapping("/code")
	public String code() {
		return "code.jsp";
	}
}
