package com.carportal.abc;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@SpringBootTest
@AutoConfigureMockMvc
class AbcApplicationTests {
	
	@Autowired
    private MockMvc mockMvc;
	
	@Test
    public void testAccessToUnsecuredPages() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/"))
               			.andExpect(MockMvcResultMatchers.status().isOk());
        
        mockMvc.perform(MockMvcRequestBuilders.get("/login"))
               			.andExpect(MockMvcResultMatchers.status().isOk());
    }
	
    @Test
    public void testAccessToViewUserManagementPageWithoutAdminRole() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/user"))
        		.andExpect(MockMvcResultMatchers
				.redirectedUrl("http://localhost:8080/login")); // Check the redirection URL
    }
    
    @Test
    public void testAccessToCarListingPage() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/cars"))
				.andExpect(MockMvcResultMatchers
				.redirectedUrl("http://localhost:8080/login")); // Check the redirection URL
    }
    
    @Test
    public void testLogin() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/login")
        		.param("userName", "an@gmail.com").param("password", "123456"))
               	.andExpect(MockMvcResultMatchers.redirectedUrl("/home"));
    }
    
    @Test
    public void testLogout() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/logout"))
               	.andExpect(MockMvcResultMatchers
               	.redirectedUrl("/logout"));
    }

	@Test
	void contextLoads() {
	}

}
