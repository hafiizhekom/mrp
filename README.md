# MRP (Manufacturing Resource Planning) Web Application

A web application for managing manufacturing business processes, including modules for Marketing, PPC, Logistics, and more. Built with PHP (CodeIgniter), integrating various third-party plugins and libraries.

## Main Features

- **Marketing**: Manage projects, quotations, customers, and job orders.
- **PPC (Production Planning & Control)**: Production scheduling, job orders, and monitoring.
- **Logistics**: Stock management, shipping, and stock opname.
- **User Management**: User and access rights management.
- **Reporting**: Export data to Excel using PhpSpreadsheet.
- **Frontend Integration**: Bootstrap, FontAwesome, Metronic, PNotify, and other plugins.


## Installation

1. **Clone the repository**
   ```sh
   git clone <repo-url>
   cd mrp
   ```

2. **Install PHP Dependencies**
   ```sh
   composer install
   ```

3. **Database Configuration**
   - Import the [mrp.sql](mrp.sql) file into your MySQL/MariaDB.
   - Edit the database configuration in `application/config/database.php`.

4. **Web Server Configuration**
   - Ensure `index.php` and the `assets/` folder are accessible from your webroot.
   - Use the `.htaccess` file for URL rewriting configuration if needed.

5. **Run the Application**
   - Access via browser: `http://localhost/mrp/` (or according to your server configuration).


## Dummy Data Note

The [mrp.sql](mrp.sql) file contains the database structure along with dummy data for testing and demonstration purposes. This data is for example only and not actual production data.