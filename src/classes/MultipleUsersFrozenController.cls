/**
 * MultipleUsersFrozen
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class MultipleUsersFrozenController {

    public User user {get; set;}
    public List<Wrapper> wrappers {get; set;}
    public Boolean isCheckedHeader {get; set;}
    public Boolean isFrozen {get; set;}

    /**
     * Constructor
     */
    public MultipleUsersFrozenController() {
    
        this.user = new User();
        this.wrappers = new List<Wrapper>();
        this.isCheckedHeader = false;
        this.isFrozen = false;
    }
    
    /**
     * Search Button
     */
    public void doSearch() {
    
        this.isCheckedHeader = false;
    
        String query = '';
        query += ' SELECT ';
        query += '  Id ';
        query += ' ,Name ';
        query += ' ,Email ';
        query += ' ,Department ';
        query += ' ,Title ';
        query += ' ,UserRoleId ';
        query += ' ,ProfileId ';
        query += ' FROM ';
        query += ' User ';
        query += ' WHERE ';
        query += ' IsActive = true ';
        
        Id loginUserId = UserInfo.getUserId();
        query += ' AND ';
        query += ' Id !=: loginUserId ';
        
        if (String.isNotEmpty(this.user.LastName)) {
            String lastName = this.user.LastName;
            query += ' AND ';
            query += ' LastName =: lastName ';
        }
        
        if (String.isNotEmpty(this.user.FirstName)) {
            String firstName = this.user.FirstName;
            query += ' AND ';
            query += ' FirstName =: firstName ';
        }
        
        if (String.isNotEmpty(this.user.Email)) {
            String email = this.user.Email;
            query += ' AND ';
            query += ' Email =: email ';
        }
        
        if (String.isNotEmpty(this.user.Department)) {
            String department = this.user.Department;
            query += ' AND ';
            query += ' Department =: department ';
        }
        
        if (String.isNotEmpty(this.user.Title)) {
            String title = this.user.Title;
            query += ' AND ';
            query += ' Title =: title ';
        }
        
        if (String.isNotEmpty(this.user.UserRoleId)) {
            Id userRoleId = this.user.UserRoleId;
            query += ' AND ';
            query += ' UserRoleId =: userRoleId ';
        }
        
        if (String.isNotEmpty(this.user.ProfileId)) {
            Id profileId = this.user.ProfileId;
            query += ' AND ';
            query += ' ProfileId =: profileId ';
        }
        
        query += ' Order By Name ASC ';
        query += ' LIMIT 200 ';
    
        List<User> users = Database.query(query);
        
        List<UserLogin> userLogins = [
            SELECT
                 Id
                ,IsFrozen
                ,UserId
            FROM
                UserLogin
            WHERE
                UserId IN: users
            AND
                IsFrozen =: this.isFrozen
            LIMIT 200
        ];
        
        Map<Id, UserLogin> userLoginMap = new Map<Id, UserLogin>();
        for (UserLogin ul : userLogins) {
            userLoginMap.put(ul.UserId, ul);
        }
        
        this.wrappers = new List<Wrapper>();
        
        for (User u : users) {
            if (userLoginMap.containskey(u.Id)) {
                this.wrappers.add(new Wrapper(u, userLoginMap.get(u.Id)));
            }
        }
    }
    
    /**
     * Wrapper Class
     */
    public class Wrapper {
    
        public Boolean isChecked {get; set;}
        public User user {get; set;}
        public UserLogin userLogin {get; set;}
    
        /**
         * Constructor
         */
        public wrapper(User user, UserLogin userLogin) {
            this.isChecked  = false;
            this.user = user;
            this.userLogin = userLogin;
        }
    }
}