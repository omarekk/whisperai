from setuptools import setup, find_packages

setup(
    name='whisper',
    version='1.0',
    packages=find_packages(),
    install_requires=[
        "torch",
        "ffmpeg-python",
        "numpy"
    ],
)
