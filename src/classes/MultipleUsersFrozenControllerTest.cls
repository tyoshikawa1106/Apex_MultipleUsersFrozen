/**
 * MultipleUsersFrozen
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class MultipleUsersFrozenControllerTest {

    /**
     * MultipleUsersFrozenControllerTest
     */
    static testMethod void MultipleUsersFrozenControllerTest() {
    
        Test.startTest();
        
        MultipleUsersFrozenController cls = new MultipleUsersFrozenController();
        System.assertEquals(cls.wrappers, new List<MultipleUsersFrozenController.Wrapper>());
        
        Test.stopTest();
    }
    
    /**
     * doSearchTest1
     */
    static testMethod void doSearchTest1() {
    
        User u = createUser(UserInfo.getProfileId(), UserInfo.getUserRoleId());
    
        Test.startTest();
        
        MultipleUsersFrozenController cls = new MultipleUsersFrozenController();
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchTestIsLastName
     */
    static testMethod void doSearchTestIsLastName() {
    
        User u = createUser(UserInfo.getProfileId(), UserInfo.getUserRoleId());
    
        Test.startTest();
        
        MultipleUsersFrozenController cls = new MultipleUsersFrozenController();
        cls.user.LastName = u.LastName;
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchTestIsFirstName
     */
    static testMethod void doSearchTestIsFirstName() {
    
        User u = createUser(UserInfo.getProfileId(), UserInfo.getUserRoleId());
    
        Test.startTest();
        
        MultipleUsersFrozenController cls = new MultipleUsersFrozenController();
        cls.user.FirstName = u.FirstName;
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchTestIsEmail
     */
    static testMethod void doSearchTestIsEmail() {
    
        User u = createUser(UserInfo.getProfileId(), UserInfo.getUserRoleId());
    
        Test.startTest();
        
        MultipleUsersFrozenController cls = new MultipleUsersFrozenController();
        cls.user.Email = u.Email;
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchTestIsDepartment
     */
    static testMethod void doSearchTestIsDepartment() {
    
        User u = createUser(UserInfo.getProfileId(), UserInfo.getUserRoleId());
    
        Test.startTest();
        
        MultipleUsersFrozenController cls = new MultipleUsersFrozenController();
        cls.user.Department = u.Department;
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchTestIsTitle
     */
    static testMethod void doSearchTestIsTitle() {
    
        User u = createUser(UserInfo.getProfileId(), UserInfo.getUserRoleId());
    
        Test.startTest();
        
        MultipleUsersFrozenController cls = new MultipleUsersFrozenController();
        cls.user.Title = u.Title;
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchTestIsUserRoleId
     */
    static testMethod void doSearchTestIsUserRoleId() {
    
        User u = createUser(UserInfo.getProfileId(), UserInfo.getUserRoleId());
    
        Test.startTest();
        
        MultipleUsersFrozenController cls = new MultipleUsersFrozenController();
        cls.user.UserRoleId = u.UserRoleId;
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchTestIsProfileId
     */
    static testMethod void doSearchTestIsProfileId() {
    
        User u = createUser(UserInfo.getProfileId(), UserInfo.getUserRoleId());
    
        Test.startTest();
        
        MultipleUsersFrozenController cls = new MultipleUsersFrozenController();
        cls.user.ProfileId = u.ProfileId;
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * createUser
     */
    private static User createUser(Id profileId, Id userRoleId) {
        
        User user = new User(
             LastName = 'Test'
            ,FirstName = 'User'
            ,Alias = 'Users'
            ,Email = 'testuser@forcedotcomdeveloper.co.jp.test'
            ,Username = 'testuser@forcedotcomdeveloper.co.jp.test'
            ,CommunityNickname = 'Test Users'
            ,EmailEncodingKey = 'ISO-2022-JP'
            ,TimeZoneSidKey = 'Asia/Tokyo'
            ,LocaleSidKey = 'ja_JP'
            ,LanguageLocaleKey = 'ja'
            ,ProfileId = profileId
            ,UserRoleId = userRoleId
            ,Department = 'development'
            ,Title = 'Force.com Developer'
        );
        insert user;
        
        return user;
    }
}