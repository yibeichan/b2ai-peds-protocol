# b2ai-peds-protocol

A structured protocol for pediatric data collection using ReproSchema. [Read more about ReproSchema here](https://www.repronim.org/reproschema/).

## Access the Protocols

The B2AI Pediatric Protocols are deployed via GitHub Pages with two versions available:

### 🌐 Live Deployment

* **[Main Landing Page](https://kind-lab.github.io/b2ai-peds-protocol/)** - Choose between protocol versions
* **[Combined Protocol](https://kind-lab.github.io/b2ai-peds-protocol/combined/)** - Complete protocol including speech tasks and assessments  
* **[Questionnaires Only](https://kind-lab.github.io/b2ai-peds-protocol/questionnaires/)** - Questionnaire-based assessments and forms

### 📋 Protocol Versions

- **Combined Protocol**: Includes all speech tasks, assessments, and questionnaires
- **Questionnaires Protocol**: Contains only the questionnaire-based components for streamlined data collection

## 🚀 Automated Deployment

This repository uses GitHub Actions for continuous integration and deployment:
- Validates both protocols using `reproschema validate`
- Builds separate UIs for each protocol
- Automatically deploys to GitHub Pages on merge to main branch



## 🛠️ Development & Testing

### Using ReproSchema-UI Directly

For development and testing, you can use the ReproSchema-UI tool to render protocols directly from GitHub:

#### Quick Testing Links
* [Test Combined Protocol](https://www.repronim.org/reproschema-ui/#/activities/0?url=https://raw.githubusercontent.com/kind-lab/b2ai-peds-protocol/main/peds-protocol-combined/peds-protocol/peds-protocol)
* [Test Questionnaires Protocol](https://www.repronim.org/reproschema-ui/#/activities/0?url=https://raw.githubusercontent.com/kind-lab/b2ai-peds-protocol/main/peds-protocol-questionnaires/peds-protocol/peds-protocol)

#### Custom Protocol Testing
You can test any protocol by using the following URL format:
```
https://www.repronim.org/reproschema-ui/#/?url=url-to-your-protocol_schema
```

### Local Development

1. Clone this repository
2. Validate schemas: `reproschema validate [protocol-folder]/activities`
3. Test locally with reproschema-ui (see [ReproSchema-UI GitHub repository](https://github.com/ReproNim/reproschema-ui))
