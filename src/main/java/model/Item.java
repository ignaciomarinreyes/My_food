
package model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;


@Entity
@Table(name = "item")
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;
    
    @Column(name = "image", nullable = true)
    private String image;
    
    @Column(name = "description", nullable = true)
    private String description;
    
    @Column(name = "price", nullable = false)
    private double price;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "ItemAndAllergen", joinColumns = @JoinColumn(name = "id_item"),
            inverseJoinColumns = @JoinColumn(name = "id_allergen"),
            foreignKey = @ForeignKey(name = "fk_ItemAndAllergen_to_item"),
            inverseForeignKey = @ForeignKey(name = "fk_ItemAndAllergen_to_allergen"))
    private Set<Allergen> allergens = new HashSet<>();
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "ItemAndIngredient", joinColumns = @JoinColumn(name = "id_item"),
            inverseJoinColumns = @JoinColumn(name = "id_ingredient"),
            foreignKey = @ForeignKey(name = "fk_ItemAndIngredient_to_item"),
            inverseForeignKey = @ForeignKey(name = "fk_ItemAndIngredient_to_ingredient"))
    private Set<Ingredient> ingredients;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "ItemAndSection", joinColumns = @JoinColumn(name = "id_item"),
            inverseJoinColumns = @JoinColumn(name = "id_section"),
            foreignKey = @ForeignKey(name = "fk_ItemAndSection_to_item"),
            inverseForeignKey = @ForeignKey(name = "fk_ItemAndSection_to_section"))
    private Set<Section> sections = new HashSet<Section>();
    
    @ManyToMany(mappedBy="items", fetch = FetchType.EAGER)
    private Set<Menu> menus = new HashSet<Menu>();



    public Item(String name) {
        this.name = name;
    }

    public Item() {

    }
    
    public void addMenu(Menu menu){
        menus.add(menu);
    }
    
    public void addSection(Section section){
        sections.add(section);
    }

    public Set<Menu> getMenus() {
        return menus;
    }

    public String getName() {
        return this.name;
    }

    public double getPrice() {
        return this.price;
    }

    public int getId() {
        return this.id;
    }

    public Set<Ingredient> getIngredients() {
        return this.ingredients;
    }

    public void addIngredient(Ingredient ingredient) {
        this.ingredients.add(ingredient);
    }

    public Set<Allergen> getAllergens() {
        return this.allergens;
    }

    public void addAllergen(Allergen allergen) {
        this.allergens.add(allergen);
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
