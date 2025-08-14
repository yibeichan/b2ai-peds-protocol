# b2ai-peds-protocol

A structured protocol for pediatric data collection using ReproSchema. [Read more about ReproSchema here](https://www.repronim.org/reproschema/).

## 🌐 Access the Protocols

The B2AI Pediatric Protocols are deployed via GitHub Pages:

* **[Main Landing Page](https://kind-lab.github.io/b2ai-peds-protocol/)** - Choose between protocol versions
* **[Questionnaires Only](https://kind-lab.github.io/b2ai-peds-protocol/questionnaires/)** - Questionnaire-based assessments and forms
* **[Combined Protocol](https://kind-lab.github.io/b2ai-peds-protocol/combined/)** - Complete protocol including speech tasks and assessments  

### 📋 Protocol Versions

- **Questionnaires Protocol**: Contains only the questionnaire-based components for streamlined data collection
- **Combined Protocol**: Includes all speech tasks, assessments, and questionnaires

---

## 🛠️ Development

### Deployment Configuration

The deployed protocols reference specific versions of the schema, controlled by `.deploy-config.json`:

```json
{
  "mode": "auto",              // "auto" or "manual"
  "manualCommit": "4fb0ce9",   // Used when mode is "manual"
  "comment": "..."
}
```

#### Configuration Modes

- **`auto` mode** (default): Automatically uses the current commit when deploying
- **`manual` mode**: Uses the specific commit hash defined in `manualCommit`

#### How to Update Protocol Version

1. **For automatic updates** (recommended):
   ```json
   {
     "mode": "auto",
     "manualCommit": "4fb0ce9"
   }
   ```

2. **To pin to a specific version**:
   ```json
   {
     "mode": "manual",
     "manualCommit": "your-commit-hash"
   }
   ```

### Automated Deployment

This repository uses GitHub Actions for CI/CD:
- Validates both protocols using `reproschema validate`
- Builds separate UIs for each protocol version
- Automatically deploys to GitHub Pages on merge to main branch
- Updates protocol versions based on `.deploy-config.json`

### Testing

#### Quick Testing Links
* [Test Questionnaires Protocol](https://www.repronim.org/reproschema-ui/#/activities/0?url=https://raw.githubusercontent.com/kind-lab/b2ai-peds-protocol/main/peds-protocol-questionnaires/peds-protocol/peds-protocol)
* [Test Combined Protocol](https://www.repronim.org/reproschema-ui/#/activities/0?url=https://raw.githubusercontent.com/kind-lab/b2ai-peds-protocol/main/peds-protocol-combined/peds-protocol/peds-protocol)

#### Using ReproSchema-UI Directly

Test any protocol using the URL format:
```
https://www.repronim.org/reproschema-ui/#/?url=url-to-your-protocol_schema
```

### Local Development

1. Clone this repository
2. Validate schemas: `reproschema validate [protocol-folder]/activities`
3. Test locally with reproschema-ui (see [ReproSchema-UI GitHub repository](https://github.com/ReproNim/reproschema-ui))