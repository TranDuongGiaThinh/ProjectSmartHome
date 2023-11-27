class Language {
  late String appName;
  late String setting;
  late String userName;
  late String fullName;
  late String email;
  late String phoneNumber;
  late String permission;
  late String livingRoom;
  late String kitchen;
  late String bedRoom;
  late String toilet;
  late List<String> listRoom = [livingRoom, kitchen, bedRoom, toilet];
  late String edit;
  late String changePassword;
  late String accountsManagement;
  late String themeModeLight;
  late String themeModeDark;
  late String typeLanguageVi;
  late String typeLanguageEn;
  late String blockUser;
  late String unBlockUser;
  late String deleteUser;
  late String updateUser;
  late String addNewUser;
  late String blocked;
  late String fullPermission;
  late String login;
  late String index;
  late String statistical;
  late String scheduling;
  late String listAccount;
  late String save;
  late String accountState;
  late String active;
  late String notHaveAccess;
  late String password;
  late String confirmPassword;
  late String ok;
  late String success;
  late String failure;
  late String and;
  late String doNotMatch;
  late String noChanges;
  

  Language(String typeLanguage) {
    if (typeLanguage == "vi") {
      appName = "Nhà thông minh";
      setting = "Cài đặt";
      userName = "Tên đăng nhập";
      fullName = "Họ và tên";
      email = "Email";
      phoneNumber = "Số điện thoại";
      permission = "Quyền truy cập";
      livingRoom = "Phòng khách";
      kitchen = "Phòng bếp";
      bedRoom = "Phòng ngủ";
      toilet = "Phòng vệ sinh";
      edit = "Chỉnh sửa";
      changePassword = "Đổi mật khẩu";
      accountsManagement = "Quản lý tài khoản khác";
      themeModeLight = "Nền: Sáng";
      themeModeDark = "Nền: tối";
      typeLanguageVi = "Ngôn ngữ: Tiếng Việt";
      typeLanguageEn = "Language: English";
      blockUser = "Khóa tài khoản";
      unBlockUser = "Mở khóa";
      deleteUser = "Xóa tài khoản";
      updateUser = "Cập nhật tài khoản";
      addNewUser = "Tạo tài khoản mới";
      blocked = "Bị khóa";
      fullPermission = "Tất cả quyền";
      login = "Đăng nhập";
      index = "Trang chủ";
      statistical = "Thống kê";
      scheduling = "Lên lịch";
      listAccount = "Danh sách tài khoản";
      save = "Lưu";
      accountState = "Trạng thái tài khoản";
      active = "Hoạt động";
      notHaveAccess = "Không có quyền truy cập";
      password = "Mật khẩu";
      confirmPassword = "Xác nhận mật khẩu";
      ok = "Ok";
      success = "Thành công";
      failure = "Thất bại";
      and = "và";
      doNotMatch = "không khớp nhau";
      noChanges = "Không có dữ liệu thay đổi";
      
    } else {
      appName = "Smart home";
      setting = "Setting";
      userName = "User name";
      fullName = "Full name";
      email = "Email";
      phoneNumber = "Phone number";
      permission = "Permission";
      livingRoom = "Living room";
      kitchen = "Kitchen";
      bedRoom = "bedRoom";
      toilet = "Toilet";
      edit = "Edit";
      changePassword = "Change password";
      accountsManagement = "Accounts management";
      themeModeLight = "Theme mode: Light";
      themeModeDark = "Theme mode: Dark";
      typeLanguageVi = "Ngôn ngữ: Tiếng Việt";
      typeLanguageEn = "Language: English";
      blockUser = "Block user";
      unBlockUser = "Unblock user";
      deleteUser = "Delete user";
      updateUser = "Update user";
      addNewUser = "Add new user";
      blocked = "Blocked";
      fullPermission = "Full permission";
      login = "Login";
      index = "Index";
      statistical = "Statistical";
      scheduling = "Scheduling";
      listAccount = "List account";
      save = "save";
      accountState = "Account state";
      active = "Active";
      notHaveAccess = "Not have access";
      password = "Password";
      confirmPassword = "Confirm password";
      ok = "Ok";
      success = "Success";
      failure = "Failure";
      and = "and";
      doNotMatch = "do not match";
      noChanges = "No data changes";

    }
  }
}
