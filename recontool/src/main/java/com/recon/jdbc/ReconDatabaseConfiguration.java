package com.recon.jdbc;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@PropertySource(value = {"classpath:application.properties"})
@EnableTransactionManagement
@EnableAutoConfiguration
public class ReconDatabaseConfiguration {


}
