# Multi-Region SaaS CRM Database System

This repository contains the final SQL script for a **Multi-Region SaaS CRM Database System** developed as part of the **Database I** course at the British University in Egypt (BUE). The schema is optimized for global deployments, supporting regional data isolation, tenant scalability, and core CRM functions such as customer management, employee roles, marketing campaigns, support tracking, and product pipelines.


---


## 🧭 High-Level Entity Map

```text
┌──────────────────────────────┐
│   HIGH-LEVEL ENTITY MAP      │
└──────────────────────────────┘
          ┌──────────┐
          │Customer  │◄──────────────────────────────────────┐
          └──────────┘                                       │
                ▲                                            │
                │(1-to-many)                                 │
┌───────────┐   │                         ┌────────────┐     │
│Support_rep│──▶│                         │Sales_Rep   │─────┘
└───────────┘   │                         └────────────┘
       ▲        │                                 ▲
       │        │                                 │
       │        │(N:N via Interact_with)          │
       │        │                                 │
┌────────────┐  │    ┌─────────────┐     ┌────────┴───────┐
│Support_ticket│◄────┤Interact_with│────▶│Campaign         │
└────────────┘       └─────────────┘     └────────────────┘
                                                ▲
                                                │ (N:N)
                                         ┌──────────────┐
                                         │Campaign_Area │
                                         └──────────────┘
   [Core operational layer]            [Marketing layer]

        ┌──────────┐
        │Product   │◄────┐
        └──────────┘     │
              ▲          │(N:N via Supply / Sales_Pipeline)
              │          ▼
        ┌──────────┐   ┌───────────────┐
        │Supplier  │   │Sales_Pipeline │
        └──────────┘   └───────────────┘
```

---

## 🧱 Table Overview

| Table               | Key Columns                                    | Purpose                                     |
| ------------------- | ---------------------------------------------- | ------------------------------------------- |
| Customer            | `Customer_ID`                                  | CRM user (buyer, lead, or support contact) |
| Employee            | `Employee_ID`, `Dept_ID`                       | Core staff table for shared details         |
| Department          | `Dept_ID`                                      | Org units (Sales, Marketing, Support, etc.) |
| Support\_Rep        | `Emp_ID`, `Dept_ID`                            | Specialized employee subtype                |
| Sales\_Rep          | `Emp_ID`, `Dept_ID`                            | Specialized employee subtype                |
| Marketer            | `Emp_ID`, `Dept_ID`, `Campaign_ID`             | Marketing employee subtype                  |
| Support\_Ticket     | `Ticket_ID`, `Cust_ID`, `SupRep_ID`            | Logged customer support requests            |
| Campaign            | `Campaign_ID`                                  | Marketing initiative                        |
| Campaign\_Area      | `(Campaign_ID, Area_ID)`                       | Region-specific campaign targeting          |
| Interact\_with      | `(Cust_ID, Camp_ID, Date)`                     | Tracks lead impressions                     |
| Current\_Customer   | `Cust_ID`, `SalesRep_ID`                       | Revenue-generating active customers         |
| Potential\_Customer | `Cust_ID`, `Marketer_ID`                       | Leads in marketing funnel                   |
| Product             | `Prod_ID`                                      | Sellable item/service                       |
| Supplier            | `Supplier_ID`                                  | Vendors or partners                         |
| Supply              | `(Supplier_ID, Prod_ID)`                       | Junction for product sourcing               |
| Sales\_Pipeline     | `Pipe_ID`, `SalesRep_ID`, `Cust_ID`, `Prod_ID` | Sales opportunity tracker                   |
| Employee\_Phone     | `(Emp_ID, Phone)`                              | 1:N for staff contacts                      |
| Supplier\_Phone     | `(Supplier_ID, Phone)`                         | 1:N for vendor contacts                     |

---

## ✅ Schema Strengths

- **Normalized Design**: Adheres to 3NF using clean junction tables to avoid redundancy.
- **Role Specialization**: Staff split by function via subtypes of `Employee`.
- **Data Integrity**: `FOREIGN KEY` constraints with `ON DELETE CASCADE` where appropriate.
- **Scalable Contact Handling**: Separate phone tables prevent null fields and support multiple numbers.
- **Clear Campaign Logic**: Leads, campaign areas, and interactions are logically separated.

---

## 🧠 Design Considerations

| Area                   | Recommendation                                                          |
| ---------------------- | ----------------------------------------------------------------------- |
| **Naming Consistency** | Standardize casing: e.g. `snake_case` for all table/column names        |
| **Surrogate Keys**     | Add auto-increment IDs to some composite PKs for better maintainability |
| **Boolean Clarity**    | Use `BOOLEAN`/`BIT` instead of `INT` for flags                          |
| **Indexes**            | Add secondary indexes on frequently queried fields                      |
| **Audit Fields**       | Add `Created_At` / `Updated_At` timestamps to transactional tables      |
| **Soft Deletes**       | Consider `IsActive` instead of hard deletes for historical traceability |
| **Hierarchical Depts** | Add `Parent_Dept_ID` if org chart depth becomes a need                  |

---

## 🚀 Getting Started

### 1. Create the Database

```sql
CREATE DATABASE crm_g30;
USE crm_g30;
```

### 2. Run the Script

Using a tool like MySQL Workbench or command-line interface:

```bash
mysql -u username -p crm_g30 < "G30 - CRM final DB.sql"
```

---

## 🧪 Suggested Enhancements

- **Views**: Add BI-oriented views for Sales Pipeline, Campaign ROI, and Lead Conversion.
- **Materialized Views**: Use them for costly queries with refresh strategies.
- **Triggers**: For ETL or real-time auditing.
- **Row-Level Security**: To separate Marketing and Support data domains (esp. with PostgreSQL).
- **Test Harness**: Use pgTAP or equivalent for unit-testing constraints and joins.

---

## 👥 Team Members

| ID     | Name                       | Email                                                                  | Group |
| ------ | -------------------------- | ---------------------------------------------------------------------- | ----- |
| 235576 | Abdelrahman Almakhzangy    | [Abdelrahman235576@bue.edu.eg](mailto:Abdelrahman235576@bue.edu.eg)     | A3    |
| 234742 | Ahmed Ali Ramadan Abdallah | [Ahmed234742@bue.edu.eg](mailto:Ahmed234742@bue.edu.eg)               | A7    |
| 235185 | Nouran Mostafa ElKady      | [Nouran235185@bue.edu.eg](mailto:Nouran235185@bue.edu.eg)             | A3    |
| 236264 | Hala Emad Gaber            | [Hala236264@bue.edu.eg](mailto:Hala236264@bue.edu.eg)                 | A4    |
| 230223 | Nadeen Ragaae Makram       | [Nadin230223@bue.edu.eg](mailto:Nadin230223@bue.edu.eg)               | A9    |

---

## 🎓 Course Information

- **Course**: Database I  
- **Institution**: The British University in Egypt (BUE)

## 📄 License

This project was developed for educational purposes as part of the Database I course.
