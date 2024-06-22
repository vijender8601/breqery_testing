package com.nucleus.config;

import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

import java.util.Collections;
import java.util.List;

@EnableWebMvc
public class MessageConverter implements WebMvcConfigurer {


    @Bean
    public MappingJackson2HttpMessageConverter jsonMessageConverter() {

        return new MappingJackson2HttpMessageConverter();

    }

    @Override
    public void configureMessageConverters (List<HttpMessageConverter<?>> converters) {
        converters.add(jsonMessageConverter());
    }

    @Bean
    public RequestMappingHandlerAdapter requestMappingHandlerAdapter() {
        RequestMappingHandlerAdapter adapter = new RequestMappingHandlerAdapter();
        adapter.setMessageConverters(Collections.singletonList(jsonMessageConverter()));
        return adapter;
    }
 }
