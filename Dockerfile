# ================================
# Simmer FastLoop Trader Dockerfile
# ================================

FROM python:3.11-slim

# Prevent Python from buffering stdout
ENV PYTHONUNBUFFERED=1

# Create non-root user
RUN useradd -m trader

# Set working directory
WORKDIR /app

# Install optional dependency (if needed)
# If you don't use tradejournal, you can remove requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt || true

# Copy app code
COPY fastloop_trader.py .
# If your filename is different, update here

# Change ownership
RUN chown -R trader:trader /app

# Switch to non-root user
USER trader

# Default command (dry run)
CMD ["python", "fastloop_trader.py"]
