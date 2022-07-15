## Replace self-managed database scheduler batch jobs using AWS native solutions

Database administrators and developers traditionally schedule scripts to run against databases using the system cron on the host where the database is running or using database schedulers, resulting in a tight coupling with the batch scripts and the database. Many Oracle database applications use files stored in a shared file system volume that is mounted on both the application and Oracle database server to load data into the database. As a managed database service, Amazon Relational Database Service (Amazon RDS) doesn’t provide access to the underlying infrastructure, so if you migrate such workloads, you must re-architect these jobs and ingestion pipelines.

To avoid the tightly coupled batch scheduling with database architecture, you can use AWS native solutions for batch scheduling as described in this post. This allows you to take advantage of fully managed Amazon RDS offerings like Amazon RDS for Oracle to reduce database management overhead and operational risk. After you decouple the batch scheduling, to reduce the dependency on database file storage, you can use Amazon S3 Integration with Amazon RDS as an alternative to shared file systems to easily, efficiently, and securely transfer data between Amazon RDS and Amazon Simple Storage Service (Amazon S3).

In this post, we present a solution that provides extensibility and portability across databases by parameterizing your batch requirements and scale without additional development efforts. You can use this solution to run various SQL scripts, shell or bash scripts, AWS Command Line Interface (AWS CLI) commands, or scripts built using programming languages such as Python, PySpark, Scala, or Java. This solution can help developers and scheduling teams decouple batch scheduling from your database and reuse it across different use cases. One additional benefit of this solution is the reusability of the script—you can have jobs that run across multiple databases, for example a tablespace utilization job.

This repository has the sample scripts that you can use to follow the blog "Replace self-managed database scheduler batch jobs using AWS native solutions" instructions.



## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

