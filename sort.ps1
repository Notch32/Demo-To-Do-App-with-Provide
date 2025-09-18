    e# Core folders
New-Item -ItemType Directory -Force -Path lib\core\constants
New-Item -ItemType Directory -Force -Path lib\core\errors
New-Item -ItemType Directory -Force -Path lib\core\utils
New-Item -ItemType Directory -Force -Path lib\core\theme

# Data folders
New-Item -ItemType Directory -Force -Path lib\data\models
New-Item -ItemType Directory -Force -Path lib\data\repositories
New-Item -ItemType Directory -Force -Path lib\data\services

# Logic
New-Item -ItemType Directory -Force -Path lib\logic

# Presentation
New-Item -ItemType Directory -Force -Path lib\presentation\pages
New-Item -ItemType Directory -Force -Path lib\presentation\widgets
New-Item -ItemType Directory -Force -Path lib\presentation\dialogs

# Routes
New-Item -ItemType Directory -Force -Path lib\routes
