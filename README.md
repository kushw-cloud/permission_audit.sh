# 🔐 Linux File Permission Audit Script

This Bash script automates common file and directory permission checks used in **Linux privilege escalation**, **CTFs**, and **system hardening**.

It helps identify:
- 🔓 World-writable files and directories
- 🧨 SUID and SGID binaries
- 🛠️ Writable cron jobs and root-owned files
- 👤 Orphaned files (no user/group)
- 📂 Writable directories in `$PATH`
- 🔍 World-readable config files

---

## 📦 Usage

```bash
sudo chmod +x perm_audit.sh
./perm_audit.sh
