# Redshift Rake Tasks

This repository contains two Rake tasks for working with Redshift in a Rails application.

### Setup:
Before running the Redshift Rake tasks, you need to configure your config/credentials.yml.enc file with the necessary Redshift connection details. Follow the steps below:

1. Open your terminal and navigate to the root directory of your Rails application.

2. Run the following command to edit your credentials file using the default editor (e.g., nano):

   ```bash 
   EDITOR="nano --wait" rails credentials:edit
   ```

   If you prefer a different editor, replace nano with the command for your preferred editor.

3. Enter your master key when prompted. This key is required to decrypt and edit the credentials file.

   Note: If you don't have a master key or if you're setting up credentials for the first time, you can create a new master key by running `rails credentials:edit`.

4. Add the following structure under the appropriate environment (development, test, production, etc.):
```bash
   redshift:
     host: <redshift_host>
     database: <redshift_database>
     username: <redshift_username>
     password: <redshift_password>

   Replace <redshift_host>, <redshift_database>, <redshift_username>, and <redshift_password> with your actual Redshift connection information.
```
5. Save and close the editor.

Now you're ready to run the Redshift Rake tasks!

### Task 1: Test Redshift Connection
The `redshift:test_connection` task allows you to test the connection to your Redshift database. It verifies if the connection can be established successfully.

To run the task, execute the following command:

```bash
rake redshift:test_connection
```

Make sure you have configured the appropriate database connection details in your database.yml file for the redshift_development environment.

### Task 2: Execute ETL (Extract, Transform, Load)

The `redshift:etl` task is used for loading transformed data or executing the ETL (Extract, Transform, Load) process in the Redshift database.

To run the task, execute the following command:

```bash
RAILS_ENV=redshift_development rake redshift:etl
```

This task is specifically designed for the redshift_development environment. Make sure you have configured the appropriate database connection details in your database.yml file.