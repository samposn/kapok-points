# kapok-points

### 部署kapok-points应用

1. 在你的MySQL里创建数据库kapok-points
    ```sql
    create database `kapok-points`;
    ```

2. 把kapok-points/script里的kapok-points.sql导入到新创建的数据库中
    ```sql
    source kapok-points.sql
    ```

3. 修改gdgxwl-base应用里application.properties中的数据库地址与用户密码
    ```sql
    c3p0.jdbcUrl=jdbc:mysql://127.0.0.1:3306/kapok-points?useUnicode=true&amp;characterEncoding=UTF-8
    c3p0.user=root
    c3p0.password=root
    ```
