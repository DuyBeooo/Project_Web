/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DuyNQ
 */
public class Cart {
    private List<Item> list; 

    public Cart() {
     list = new ArrayList<>();
    }

    public Cart(List<Item> list) {
        this.list = list;
    }

    public List<Item> getList() {
        return list;
    }

    public void setList(List<Item> list) {
        this.list = list;
    }
    
    public Item getItemById(int pid){
        for (Item i : list) {
            if(i.getProduct().getId()==pid)
                return i;
        }
        return null;
    }
    
    public int getQuantityById(int pid){
        return getItemById(pid).getQuantity();
    }
    
    public void addToCart(Item item){
        // da co trong gio roi
        if (getItemById(item.getProduct().getId())!=null) {
            Item i = getItemById(item.getProduct().getId());
            i.setQuantity(i.getQuantity()+1);
        }else{// chua co trong gio
            list.add(item);
        }
    }
    
    public void deleteItem(int pid){
        list.remove(getItemById(pid));
    }
    
    public int getTotalMoney(){
        int total =0;
        for (Item item : list) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }
        return total;
    }
}
