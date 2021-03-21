{ //start scope

    //#region vars
    let viewPlanMenu = $('[data-permission="viewplanmenu"]'),
        viewStatisticsMenu = $('[data-permission="viewstatisticsmenu"]'),
        systemAdministrationMenu = $('[data-permission="systemadministrationmenu"]'),
        viewFollowupsMenu = $('[data-permission="viewfollowupsmenu"]'),
        planYear = $('[data-permission="planyear"]'),
        planCountry = $('[data-permission="plancountry"]'),
        planCity = $('[data-permission="plancity"]'),
        campStatus = $('[data-permission="campstatus"]'),
        planTour = $('[data-permission="plantour"]'),
        planTeam = $('[data-permission="planteam"]'),
        planSponsor = $('[data-permission="plansponsor"]'),
        newUser = $('[data-permission="newuser"]'),
        roleDivider = $('[data-permission="roledivider"]'),
        rolesGroup = $('[data-permission="rolesgroup"]'),
        usersRoles = $('[data-permission="usersroles"]'),
        changePassword = $('[data-permission="changepassword"]'),
        roles = $('[data-permission="roles"]'),
        followUpsDrugsMenu = $('[data-permission="followupsdrugsmenu"]'),
        followupsFinancial = $('[data-permission="followupsfinancial"]'),
        followupsAdministrative = $('[data-permission="followupsadministrative"]'),
        followupsMedia = $('[data-permission="followupsmedia"]'),
        usersAndPermissionsMenu = $('[data-permission="usersandpermissionsmenu"]'),
        loadingDiv = $('#loading');
    //#endregion vars

    //#region page

    $(document).ready(function () {
        /*checkRights('SystemAdministrationMenu', systemAdministrationMenu);
        //checkRights('UsersAndPermissionsMenu', usersAndPermissionsMenu);
        //checkRights('ViewFollowupsMenu', viewFollowupsMenu);
        checkRights('ViewPlanMenu', viewPlanMenu);
        checkRights('PlanYear', planYear);
        checkRights('PlanCountry', planCountry);
        checkRights('PlanCity', planCity);
        checkRights('CampStatus', campStatus);
        checkRights('PlanTour', planTour);
        checkRights('PlanTeam', planTeam);
        checkRights('PlanSponsor', planSponsor);
        checkRights('ViewStatisticsMenu', viewStatisticsMenu);
        checkRights('NewUser', newUser);
        checkRights('RoleDivider', roleDivider);
        checkRights('RolesGroup', rolesGroup);
        checkRights('UsersRoles', usersRoles);
        checkRights('Roles', roles);
        checkRights('followUpsDrugsMenu', followUpsDrugsMenu);
        checkRights('FollowupsFinancial', followupsFinancial);
        checkRights('FollowupsAdministrative', followupsAdministrative);
        checkRights('FollowupsMedia', followupsMedia);
        checkRights('ChangePassword', changePassword);
        */

    });
    //#endregion page

    //#region function
    let checkRights = function (role, elm) {
        //elm.hide();
        if (getAccessInfo().access_token == null) {
            window.location.href = "../Home/SignIn";
        }
        else {
            $.ajax({
                url: getUrl() + '/Basar/UserHelper/Check',
                type: 'POST',
                headers: {
                    'Authorization': 'Bearer '
                        + getAccessInfo().access_token
                },
                data: JSON.stringify(
                    { 'RoleName': role }
                ),
                contentType: "application/json;charset=UTF-8",
                dataType: "json",
                beforeSend(jqXHR) {
                    loadingDiv.show();

                },
                complete: function () {
                    loadingDiv.hide();

                },
                success: function (data) {
                    if (data == true) {
                        elm.show();
                    }
                    else {
                        elm.hide();
                    }
                },
                error: function (jqXHR) {
                    // elm.hide();
                    console.log(jqXHR);
                    /*if (jqXHR.status == '401') {
                        sessionStorage.removeItem('loginInfo');
                        window.location.href = "../Home/SignIn";
                    }*/


                }
            });
        }
      
    };
    //#endregion function

} //end scope