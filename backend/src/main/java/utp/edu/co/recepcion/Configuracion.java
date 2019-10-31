package utp.edu.co.recepcion;

import org.modelmapper.ModelMapper;
import org.modelmapper.config.Configuration.AccessLevel;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import utp.edu.co.recepcion.dto.UsuariosDTO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jhon
 */
@Configuration
public class Configuracion {
    
    @Bean
    public ModelMapper modelMapper(){
        ModelMapper modelMapper =  new ModelMapper();
        return modelMapper;
    }
    
}