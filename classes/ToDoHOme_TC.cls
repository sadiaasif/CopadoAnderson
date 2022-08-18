@isTest
private class ToDoHOme_TC {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        
        HomeToDos h = new HomeToDos();
        
        h.getCompleted();
        h.getTodo();
        h.getTodoList();
        h.setTodo(null);
        h.getSortDirection();
        h.setSortDirection('asc');
        h.sortExpression ='name';
       // h.sortExpression = 'order by desc';
        h.ViewData();
        
    }
}