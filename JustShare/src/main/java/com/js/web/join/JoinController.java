package com.js.web.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;

	@GetMapping("/join")
	public String join() {
	  return "join"; 
		}
	
	@PostMapping("/join")
	public String join(JoinDTO joinDTO) {
		//System.out.println("jsp에서 오는 값 : " + joinDTO);
		
		int result = joinService.join(joinDTO);
		
		if(result == 1) {
		
		return "redirect:/index";
	}else {
	return "redirect:/join";
}
	
	}
	
	
	
	//아이디 중복검사
	@ResponseBody
	@PostMapping("/checkID")
	public String checkID(@RequestParam("mid") String mid) {
		System.out.println("id : " + mid);
		int result = joinService.checkID(mid);
			return result + "";
	}
	
	
	
	
}