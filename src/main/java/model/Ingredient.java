
package model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


@Entity
@Table(name = "ingredient")
public class Ingredient {

    public Ingredient(String name) {
        this.name = name;
    }
 
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;
    
    @ManyToMany(mappedBy="ingredients", fetch = FetchType.EAGER)
    private Set<Item> items = new HashSet<Item>();

    public Ingredient(Item itemIngredient, String parameter) {
        this.name = parameter;
        this.items.add(itemIngredient);
    }

    public Ingredient() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
    
}
