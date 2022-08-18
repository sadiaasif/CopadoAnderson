trigger UpdateCaseField on CaseComment (after insert) {
    list<Case> aList = new list<Case>();
    
    for (CaseComment each : trigger.new) {
        Case c= new Case(id = each.ParentId);
        c.Id = each.ParentId;
        c.CaseCommentDate__c= system.now();
        aList.add(c);
    }
    update aList;
}