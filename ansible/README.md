# Ansible-based Dotfiles Setup

An Infrastructure-as-Code approach to managing your development environment using Ansible.

## 🚀 Quick Start

```bash
# Install Ansible if not already installed
brew install ansible

# Full setup with provisioning
cd ansible
./bootstrap-ansible --provision

# Or just create symlinks (if already provisioned)
./bootstrap-ansible
```

## 📋 What This Replaces

This Ansible playbook replicates the behavior of:
- `./bootstrap --provision` → `./bootstrap-ansible --provision`
- `./bootstrap` → `./bootstrap-ansible`

## 🎯 Advantages Over Bash Scripts

### **Idempotency**
- Safe to run multiple times
- Only makes changes when needed
- No duplicate installations

### **Better Error Handling**
- Detailed error messages
- Graceful failure recovery
- Rollback capabilities

### **Modularity**
- Tagged tasks for selective execution
- Clear separation of concerns
- Easy to extend and maintain

### **Declarative Configuration**
- YAML-based configuration
- Version-controlled infrastructure
- Reproducible environments

## 🏗 Architecture

### **Files Structure**
```
ansible/
├── playbook.yml        # Main Ansible playbook
├── inventory          # Ansible inventory (localhost)
├── ansible.cfg        # Ansible configuration
├── bootstrap-ansible  # Wrapper script
└── README.md         # This file
```

### **Task Organization**
- **Homebrew**: Package installation and management
- **Symlinks**: Dotfile symlinking (always runs)
- **Directories**: Directory creation (always runs)
- **Services**: Database and service management
- **Languages**: asdf-based version management
- **Tools**: Additional tool configuration

## 🏷 Tags

Run specific parts of the setup:

```bash
# Only install Homebrew packages
ansible-playbook -i inventory playbook.yml --tags homebrew

# Only create symlinks and directories
ansible-playbook -i inventory playbook.yml --tags symlinks,directories

# Only setup languages
ansible-playbook -i inventory playbook.yml --tags asdf

# Skip time-consuming tasks
ansible-playbook -i inventory playbook.yml --skip-tags asdf,homebrew
```

## 🔧 Configuration

### **Language Versions**
Edit the `language_versions` variable in `playbook.yml`:
```yaml
language_versions:
  nodejs: "22.11.0"
  ruby: "3.3.0"
  python: "3.12.0"
  terraform: "1.9.0"
```

### **Homebrew Packages**
Modify the `homebrew_packages` list in `playbook.yml`:
```yaml
homebrew_packages:
  - git
  - neovim
  - your-package-here
```

### **Symlinks**
Add new symlinks to the `dotfile_symlinks` list:
```yaml
dotfile_symlinks:
  - src: "your-config/file"
    dest: ".your-config"
```

## 🚨 Troubleshooting

### **Ansible Not Found**
```bash
brew install ansible
```

### **Permission Errors**
```bash
# Make sure the script is executable
chmod +x bootstrap-ansible
```

### **Homebrew Module Issues**
```bash
# Update Ansible
brew upgrade ansible

# Install community collection
ansible-galaxy collection install community.general
```

### **Task Failures**
```bash
# Run with verbose output
ansible-playbook -i inventory playbook.yml -v

# Run in check mode (dry run)
ansible-playbook -i inventory playbook.yml --check
```

## 📊 Comparison with Bash

| Feature | Bash Script | Ansible |
|---------|-------------|---------|
| Idempotency | ❌ | ✅ |
| Error Handling | ⚠️ | ✅ |
| Modularity | ⚠️ | ✅ |
| Readability | ⚠️ | ✅ |
| Debugging | ❌ | ✅ |
| Rollback | ❌ | ✅ |
| Documentation | ⚠️ | ✅ |

## 🔄 Development Workflow

### **Testing Changes**
```bash
# Dry run to see what would change
ansible-playbook -i inventory playbook.yml --check --diff

# Run only specific tags
ansible-playbook -i inventory playbook.yml --tags symlinks
```

### **Adding New Features**
1. Add variables to the `vars` section
2. Add tasks with appropriate tags
3. Test with `--check` mode
4. Run on a clean environment

### **Debugging**
```bash
# Verbose output
ansible-playbook -i inventory playbook.yml -vvv

# Step through tasks
ansible-playbook -i inventory playbook.yml --step
```

## 🎯 Next Steps

1. **Test the setup**: Run `./bootstrap-ansible --provision` on a clean system
2. **Customize variables**: Modify language versions and package lists
3. **Add new features**: Extend the playbook with additional tasks
4. **CI/CD Integration**: Set up automated testing of the playbook

## 📝 Migration from Bash

The Ansible setup is designed to be a drop-in replacement:
- Same end result as bash scripts
- Same directory structure
- Same configuration files
- Better reliability and maintainability

You can still use the original bash scripts if needed - they coexist peacefully.