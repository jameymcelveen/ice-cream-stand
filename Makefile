# Makefile for MATLAB/Octave Project
.PHONY: validate run quiet-run demo demo-dark demo-light demo-transparent test clean

# The name of your main script (without the .m)
SCRIPT_NAME = ice_cream_shop

# Check if octave is installed using 'command -v' (more portable than 'which')
validate:
	@command -v octave >/dev/null 2>&1 || { echo >&2 "Error: Octave is not installed. Run 'brew install octave' first."; exit 1; }
	@echo "Checking environment... Octave found."
	@echo "Octave is an open-source alternative to MATLAB. You can run this project using Octave without needing a MATLAB license."

# Run the script
# The --no-gui flag is faster for CLI programs
# The --eval flag tells Octave to execute the string as a command
run: validate
	@echo "Launching $(SCRIPT_NAME)..."
	@octave --no-gui --eval "$(SCRIPT_NAME)"

# Run the script but suppress all output (for demo purposes)	
quiet-run:
	@octave --no-gui --eval "$(SCRIPT_NAME)"

# Create the demo for GitHub Dark theme
demo-dark:
	@vhs < demo-dark.tape

# Create the demo for GitHub Light theme
demo-light:
	@vhs < demo-light.tape

# Create the demo with a transparent background (for social sharing)
demo-transparent:
	@vhs < demo-transparent.tape

# demo: Run all demos
demo: validate demo-dark demo-light demo-transparent

# Test if Octave is working without the full CLI interaction,
test: validate
	@echo "Running tests..."
	@octave --no-gui --eval "disp('Octave is working!')"

# Optional: clean up any octave core dumps or temp files
clean:
	@rm -f octave-workspace