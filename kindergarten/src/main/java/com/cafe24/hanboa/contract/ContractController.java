package com.cafe24.hanboa.contract;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContractController {
	@Autowired 
	public ContractService contractService;

	private static final Logger logger = LoggerFactory.getLogger(Contract.class);
	
	// 1. 목록조회
	@RequestMapping(value="/ContractList")
	public String contractList(Model model, HttpSession session) {
		logger.info("1. ContractController -- ContractList : {}");
		List<Contract> list = contractService.getContractList();
		logger.info("1. ContractController -- ContractList : {}", list);
		logger.debug("-----------------------------------------");
		model.addAttribute("list",list);
		return "contract/contract_list";		
	}
	
	// 2. 수정정보요청
	@RequestMapping(value="/contract/contract_modify", method=RequestMethod.GET)
	public String contractModify(Model model, @RequestParam(value="contractCd", required=true)String contractCd) {
		Contract contract = contractService.modifyGetContract(contractCd);
		logger.debug("{} <- ContractCd ContactController.java",contractCd);
		logger.debug("{} <- Contract ContractController.java",contract);
		model.addAttribute("contract", contract);
		return "contract/contract_modify";		
	}
	
	//3. 수정처리
	@RequestMapping(value="/contract/contract_modify", method=RequestMethod.POST)
	public String contractModify(Model model, Contract contract) {
		contractService.modifyContract(contract);
		logger.debug("{} < - contractModify 메서드실행 ContractController.java",contract);
		return "redirect:/contract/contract_list";		
	}
	
	// 4. 등록화면
	@RequestMapping(value="/ContractAdd", method=RequestMethod.GET)
	public String contractAdd() {
		logger.debug("{} < -- contractAdd ContractController.java contractInsertForm");
		return "contract/contract_add";
		
	}
	
	// 5. 등록
	@RequestMapping(value="/ContractAdd", method=RequestMethod.POST)
	public String contractAdd(Model model, Contract contract) {
		logger.debug("{} <-- contractAdd(입력처리) ContractController.java",contract);
		contractService.insertContract(contract);
		return "redirect:/";
	}
}
