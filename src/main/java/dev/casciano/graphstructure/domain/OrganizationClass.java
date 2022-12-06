package dev.casciano.graphstructure.domain;

import java.util.UUID;

import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.Node;

import ac.simons.neo4j.migrations.annotations.catalog.Required;
import ac.simons.neo4j.migrations.annotations.catalog.Unique;

@Node
public class OrganizationClass {
    @Id
    @GeneratedValue
    private UUID id;
    
    @Required
    @Unique
    private String name;

    public OrganizationClass() {
    }

    public OrganizationClass(UUID id, String name) {
        this.id = id;
        this.name = name;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
