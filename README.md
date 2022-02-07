## Replace self-managed database scheduler batch jobs using AWS native solutions

Many AWS customers use database-specific schedulers such as Oracle Database Scheduler and have a tightly coupled batch scheduling architecture with their database instance by installing Oracle Database on Amazon Elastic Compute Cloud (Amazon EC2) instances. With Amazon RDS Custom for Oracle, you get access to the underlying OS and DB environment; however, it comes with some management overhead. To have a completely decoupled batch scheduling and database architecture, and to reduce database management overhead and operational risk, you can use AWS native solutions for batch scheduling and take advantage of the fully managed Amazon RDS offering. 

In the blog post < >, we demonstrate how you can use Amazon EventBridge, AWS Step Functions, and AWS Batch to schedule and orchestrate your batch scripts. This architecture provides options to parameterize your batch requirements and scale without additional development efforts. You can use this solution to run various database and SQL scripts, bash scripts, Python scripts, and AWS service-specific tasks using the AWS Command Line Interface (AWS CLI). Additionally, you can extend the solution to run scripts built using programming languages such as PySpark, Scala, or Java. 

This repository "This repository "orchestrate-batchscripts-awsnative" has the sample scripts that you can use to follow the blog instructions.



## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

