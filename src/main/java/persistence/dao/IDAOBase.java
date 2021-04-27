/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.dao;

interface IDAOBase<T> {
    public int create(T createClase); 
    public T read(int id); 
    public void update(T updateClase); 
    public void remove(int id) throws IllegalStateException; 
}
