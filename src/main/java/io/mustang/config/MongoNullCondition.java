package io.mustang.config;

import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.type.AnnotatedTypeMetadata;

/**
 * @author: Mustang mustang2247@gmail.com
 **/
public class MongoNullCondition implements Condition {

    @Override
    public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
        String database = context.getEnvironment().getProperty("renren.database");
        return !"mongodb".equalsIgnoreCase(database);
    }
}
