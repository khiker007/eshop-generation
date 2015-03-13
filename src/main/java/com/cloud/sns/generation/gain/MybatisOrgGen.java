package com.cloud.sns.generation.gain;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

/**
 * @ClassName net.sns.generation.gain.MybatisOrgGen
 * @description
 * @author : spencer
 * @Create Date : 2014-3-13 下午12:02:03
 */
public class MybatisOrgGen {
    public static void main(String[] args) {
        try {
            /* 官网的生成代码 */
            List<String> warnings = new ArrayList<String>();
            boolean overwrite = true;
            File configFile = new File("gain/generatorConfig.xml");
            ConfigurationParser cp = new ConfigurationParser(warnings);
            Configuration config;
            config = cp.parseConfiguration(configFile);
            DefaultShellCallback callback = new DefaultShellCallback(overwrite);
            MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback,
                    warnings);
            myBatisGenerator.generate(null);
            System.out.println("++++Ok");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}