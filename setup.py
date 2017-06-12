from setuptools import setup

# Please use setup_pip.py for generating and deploying pip installation
# detailed instruction in setup_pip.py
setup(name='ffm',
      version='7e8621d',
      description="LibFFM Python Package",
      long_description="LibFFM Python Package",
      install_requires=[
          'numpy',
      ],
      maintainer='',
      maintainer_email='',
      zip_safe=False,
      packages=['ffm'],
      package_data={'ffm': ['libffm.so']},
      include_package_data=True,
      license='BSD 3-clause',
      classifiers=['License :: OSI Approved :: BSD 3-clause'],
      url='https://github.com/alexeygrigorev/libffm-python'
)
